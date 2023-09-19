package com.example.flutter_demo.controller;

import com.example.flutter_demo.model.Destination;
import com.example.flutter_demo.service.DestinationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/destination")
@CrossOrigin(origins = "http://192.168.0.1:8080")
public class DestinationRepository {
    @Autowired
    DestinationService destinationService;

    @GetMapping("/getAll")
    public List<Destination> getAllDestination(){
        try{
            return destinationService.getAllDestination();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
