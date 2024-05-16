package com.example.testMaven.controller;

import com.example.testMaven.dto.BoardDTO;
import com.example.testMaven.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class BoardController {
    private final BoardService boardService;

    @GetMapping("/save")
    public String save() {
        return "save";
    }

    @PostMapping("/save")
    public String save(BoardDTO boardDTO) {
        System.out.println("boardDTO = " + boardDTO);
        boardService.save(boardDTO);
        return "redirect:/list";
    }

    @GetMapping("/list")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll(0);
        model.addAttribute("boardList", boardDTOList);
        System.out.println("boardDTOList = " + boardDTOList);
        return "list";
    }

    @GetMapping("/list/more")
    @ResponseBody
    public ResponseEntity<List<BoardDTO>> loadMore(@RequestParam(defaultValue = "0") int offset) {
        List<BoardDTO> boardList = boardService.findAll(offset);
        return ResponseEntity.ok(boardList);
    }

    // id로 게시글 조회 /1, /2, /10
    @GetMapping("/{id}")
    public String findById(@PathVariable("id") Long id, Model model ) {
        // 조회수 처리
        boardService.updateHits(id);
        // 상세내용 가져옴
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "detail";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "update";
    }

    @PostMapping("/update/{id}")
    public String update(BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);
        return "detail";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        boardService.delete(id);
        return "redirect:/list";
    }

    @PostMapping("/delete")
    public String deleteMultiple(@RequestParam("boardId") List<Long> ids) {
        for (Long id : ids) {
            boardService.delete(id);
        }
        return "redirect:/list";
    }

}
