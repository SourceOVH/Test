package com.frusi.ITAlliance.models;

import javax.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "requests")
@Data
public class Request {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "title")

    private String title;

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "date_of_created")
    private LocalDateTime dateOfCreated;

    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
        if (status == null) {
            Status defaultStatus = new Status();
            defaultStatus.setId(1L);
            status = defaultStatus;
        }
    }

}
