package com.example.demo.repository;

import com.example.demo.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository <Message, Integer> {

    List<Message> findByTag (String tag);

    List<Message> findByName (String name);
}
