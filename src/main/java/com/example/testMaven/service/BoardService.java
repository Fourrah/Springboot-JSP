package com.example.testMaven.service;

import com.example.testMaven.dto.BoardDTO;
import com.example.testMaven.repository.BoardRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    private BoardRepository boardRepository;

    public BoardService(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    public void save(BoardDTO boardDTO) {
        boardRepository.save(boardDTO);
    }

    public List<BoardDTO> findAll(int offset) {
        return boardRepository.findAll(offset);
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }
}
