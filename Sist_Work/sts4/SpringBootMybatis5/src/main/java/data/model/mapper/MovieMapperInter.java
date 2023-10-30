package data.model.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.model.dto.MovieDto;


@Mapper
public interface MovieMapperInter {
	public int getTotalMovie();
	public void insertMovie(MovieDto dto);
	public List<MovieDto> getAllMovies();
	public MovieDto getMovie(String num);
	public void updateMovie(MovieDto dto);
	public void deleteMovie(String num);
}