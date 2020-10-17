package com.naji.simplelibrary.model.entity;

import lombok.*;

import javax.persistence.*;
import java.sql.Blob;
import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String firstName;
    private String lastName;
    private String nationalCode;
    private Integer membershipNumber;
    private byte[] picture;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    List<LendingBook> lendingBooks;

    @Transient
    String base64Encoded;
}
