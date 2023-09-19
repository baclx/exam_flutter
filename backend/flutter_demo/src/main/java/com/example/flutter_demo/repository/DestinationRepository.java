package com.example.flutter_demo.repository;

import com.example.flutter_demo.model.Destination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DestinationRepository extends JpaRepository<Destination,Integer> {
}
