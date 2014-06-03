package test.phone.directory.logic.model.domain

import javax.persistence.{Column, Table, Entity}
import org.hibernate.annotations.AccessType
import javax.validation.constraints.NotNull

@Entity
@Table(name = "record")
@AccessType("field")
class Record extends BaseEntity {

  @Column(name = "name", length = 128)
  var name: String = _

  @Column(name = "number", length = 13, nullable = false)
  @NotNull
  var number: String = _
}
