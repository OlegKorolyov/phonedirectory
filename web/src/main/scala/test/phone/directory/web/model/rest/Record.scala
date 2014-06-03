package test.phone.directory.web.model.rest

import test.phone.directory.logic.model.domain
import com.fasterxml.jackson.databind.annotation.JsonDeserialize

case class Record(
  id: Long,
  name: String,
  number: String) {}

object Record {
  def transform(dRecord: domain.Record): Record =
    Record(id = dRecord.id, name = dRecord.name, number = dRecord.number)
}
