if (window.NodeList && !NodeList.prototype.forEach) {
    NodeList.prototype.forEach = Array.prototype.forEach;
}

function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}

var CustomUi = (function(cui) {

    var filter   = 'win16|win32|win64|mac|macintel';

    var uiRdCh = function(){
        //input radio, checkbox

        var _inp    = document.querySelectorAll('input[type=radio], input[type=checkbox]');

        _inp.forEach(function(el) {

            var _wrap = el.parentNode,
                    _wrap_tag = _wrap.tagName.toLowerCase();

            if( _wrap_tag  == 'label' && _wrap.querySelector('._icon') == null ){

                var span = document.createElement("span");
                    span.setAttribute('class', '_icon');

                insertAfter(el, span);
            }

        });
    }


    var uiNumber = function() {

        //input number

        var _inp    = document.querySelectorAll('[type=number], [data-type="number"]');

        if ( navigator.platform ) {

            if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {

                _inp.forEach(function(el, idx) {

                    var inpType = el.getAttribute('type');

                    //mobile
                    if(inpType != 'number'){

                        // _inp.setAttribute('type', 'number').setAttribute('inputmode', 'numeric');

                    }

                    //pc
                    // _inp.setAttribute('pattern', '[0-9.]*');

                });
            }
        }


        var ios = (/iphone|ipad|ipod/).test(navigator.userAgent.toLowerCase());
        _inp.forEach(function(el) {
            // el.setAttribute('inputmode', 'decimal');
            el.setAttribute('pattern','[0-9.]*');
            el.style.imeMode = 'inactive';
            // el.setAttribute('style','ime-mode:disabled');
            if(el.getAttribute('type') == 'number') {
                el.setAttribute('pattern','[0-9]*');
                el.addEventListener('keydown', function() {
                    switch (event.keyCode) {
                        case 229:
                        case 190:
                            event.preventDefault();
                            return false;
                            break;
                    };
                })
            }
            // el.addEventListener('keyup', function() {
            //     if(event.keyCode === 229) {
            //         this.value = this.value.replace(/[^0-9.]/gi, '');
            //     }
            // })
            // if(isMobile) {
            //     el.setAttribute('type','number');
            //     el.setAttribute('inputmode', 'numeric');
            //     el.setAttribute('step','0.1');
            //     el.addEventListener('keyup', function() {
            //         this.value = this.value.replace(/[^0-9.]/gi, '');
            //     })
            // }
            el.addEventListener('input', function() {
                var maxLen = el.getAttribute('maxlength') || -1;
                if(this.getAttribute('type') != 'number') {
                    this.value = this.value.replace(/[^0-9.]/g, '');
                    if(this.value.split('.').length >= 3) {
                        var duplic = Number(this.value.indexOf('.')) + 1;
                        var char = this.value.slice(0, duplic);
                        for(var i = duplic; i < this.value.length; i++) {
                            if(this.value[i] != '.') {
                                char += this.value[i]
                            }
                        }
                        this.value = char;
                    }
                }else {
                    this.value = this.value.replace(/[^0-9]/g, '');
                }
                if(maxLen > 0){
                    this.value = this.value.substr(0, maxLen);
                }
            });
        });
    }

    var uiSel = function() {
        //input select

        var _sel    = document.querySelectorAll('select.sel'),

        placeholder = function(el){

            var val     = el.value;
            var place   = el.getAttribute('data-placeholder');

            if(val == '' || val == null || val ==  place ){

                if(!el.classList.contains('placeholder')){

                    el.classList.add('placeholder');

                }

            }else{

                if(el.classList.contains('placeholder')){

                    el.classList.remove('placeholder');

                }

            }
        }

        _sel.forEach(function(el) {
            var _wrap = el.parentNode;

            if(!_wrap.classList.contains('sel_box')){
                var div = document.createElement("div");
                    div.setAttribute('class', 'sel_box');

                insertAfter(el, div);
                div.appendChild(el);
            }

            placeholder(el);

            if(!el.classList.contains('__customUi')){

                el.classList.add('__customUi');

                el.addEventListener('change', function() {

                    placeholder(el);

                });
            }

        });

    }

    var dropZone = function() {
        var dropZone = $("#dropZone"),
            dropZoneWrap = $('#dropZoneWrap');
        if(dropZone.length === 0) return;
        var inpFile = dropZone.find('input[type=file]');

        var fileIndex = Number(dropZone[0].dataset.fileindex || 0),
            totalFileSize = Number(dropZone[0].dataset.totalfilesize),
            fileList = new Array();
            fileSizeList = new Array();
            uploadCnt = Number(dropZone[0].dataset.uploadcnt),
            uploadSize = Number(dropZone[0].dataset.uploadsize),  //개별 MAX사이즈 (MB)
            maxUploadSize = Number(dropZone[0].dataset.maxuploadsize);  //전체제한 MB

        dropZone.find('.file_index').each(function(idx, el) {
            $(this).find('.remove_file').off('click').on('click',deleteFile);
        })



        inpFile.on('click', function(e) {
            e.stopPropagation();
        }).on('change', function(e) {
            isFiles(this.files);
        })

        //Drag기능
        dropZone.on('click', function(e) {
            e.stopPropagation();
            e.preventDefault();
            $(this).find('input[type=file]').click();
        })
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            dropZoneWrap.removeClass('over');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            dropZoneWrap.removeClass('drop').addClass('over');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            dropZoneWrap.removeClass('over');

            isFiles(e.originalEvent.dataTransfer.files);
        });

        function isFiles(files) {
            if(files != null){
                if(files.length < 1){
                    alert("파일을 선택하여 주세요.");
                    deSelectFile()
                    return;
                }
                selectFile(files)
            }else{
                alert("파일등록에 실패하였습니다.");
            }
        }
        function deSelectFile() {
            $('#dropZone .file_index').remove();
            dropZoneWrap.removeClass('drop over');
        }

        function selectFile(fileObject){
            var ncnt = $('#dropZoneWrap').find("div[id^=fileTr_]").length;
            var limitCnt = uploadCnt - ncnt;


            if(fileObject != null){
                for(var i = 0; i < fileObject.length; i++){

                    if((i+1) > limitCnt){
                        alert('첨부파일은 ' + uploadCnt + '개 까지 등록하실 수 있습니다');
                        return;
                    }

                    var fileName = fileObject[i].name;
                    var fileNameArr = fileName.split("\.");
                    var ext = fileNameArr[fileNameArr.length - 1];
                    var fileSize = fileObject[i].size / 1024 / 1024;

                    if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'htm', 'cgi', 'php', 'asp', 'js', 'css', 'xml']) >= 0){
                        alert(ext + "파일은 등록이 허용되지 않습니다.");
                        break;
                    }else if(fileSize > uploadSize){
                        alert("첨부파일 용량이 초과되었습니다. (" + uploadSize + " MB이내)");
                        break;
                    }else{
                        totalFileSize += fileSize;
                        fileList[fileIndex] = fileObject[i];
                        fileSizeList[fileIndex] = fileSize;
                        addFileList(fileIndex, fileName, fileSize, ext);
                        fileIndex++;
                    }
                }
            }else{
                alert("등록하실 파일이 없습니다");
            }
        }
        // 업로드 파일 목록 생성
        function addFileList(fIndex, fileName, fileSize, ext){
            var chkExt = ext.toLowerCase();

            var html = "";
            html += "<div id='fileTr_" + fIndex + "' class='file_index'>";
            html +=      "<button type='button' class='remove_file'></button>" + fileName + " <span class='file_size'> (" + getfileSize(fileSize * 1024 * 1024) + ")</span>";
            html += "</div>";
            var fileIdx = fIndex;
            $('#dropZone').append(html);
            $('#dropZoneWrap').addClass('drop');
            $('#dropZoneWrap').find('.remove_file').off('click').on('click',deleteFile);
        }
        function getfileSize(x) {
            var s = ['bytes', 'kB', 'MB', 'GB', 'TB', 'PB'];
            var e = Math.floor(Math.log(x) / Math.log(1024));
            return (x / Math.pow(1024, e)).toFixed(2) + s[e];
        };

        function deleteFile(){
            event.stopPropagation();
            var par = $(event.currentTarget).parent().parent();
            var fileIdx = this.parentNode.id.replace(/[a-zA-Z_]/gi,'');
            totalFileSize -= fileSizeList[fileIdx];
            delete fileList[fileIdx];
            delete fileSizeList[fileIdx];
            $("#fileTr_" + fileIdx).remove();
            if(par.find('.file_index').length <= 0) {
                par.closest('#dropZoneWrap').removeClass('drop');
            }
        };
    }

    function init(){

        uiRdCh();
        uiNumber();

        //uiSel();

        // dropZone();

    }

    return {
       'init'   : init,
       'rdCh '  : uiRdCh,
       'number' : uiNumber,
       'sel'    : uiSel,
    };
})();


$(function() {
    // alert('ui')
    CustomUi.init();
})
window.addEventListener('load', function(){


});
