package com.example.flutter_demo.service.impl;

import com.example.flutter_demo.model.Destination;
import com.example.flutter_demo.repository.DestinationRepository;
import com.example.flutter_demo.service.DestinationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DestinationServiceImp implements DestinationService {
    @Autowired
    DestinationRepository destinationRepository;

    @Override
    public List<Destination> getAllDestination(){
        try{
            return destinationRepository.findAll();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
