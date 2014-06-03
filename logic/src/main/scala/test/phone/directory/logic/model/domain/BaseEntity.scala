package test.phone.directory.logic.model.domain

import java.{lang ⇒ jl}
import javax.persistence.{GenerationType, GeneratedValue, Id}

trait BaseEntity {
  type Identifier = jl.Long

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  var id: Identifier = _

}
