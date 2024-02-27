package com.frusi.ITAlliance.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "status")
@Data
public class Status {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "status", columnDefinition = "varchar(255) default 'На рассмотрении'")
    private String name;

    @PrePersist
    private void init() {
        name = "На рассмотрении";
    }
}
