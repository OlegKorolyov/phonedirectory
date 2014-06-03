package test.phone.directory.web.controller

import org.springframework.web.bind.annotation._
import org.springframework.transaction.annotation.Transactional
import test.phone.directory.logic.service.RecordService
import javax.inject.Inject
import javax.validation.Valid
import test.phone.directory.logic.support.ListFilter
import test.phone.directory.web.model.rest.Record
import test.phone.directory.logic.model.domain
import java.{lang ⇒ jl}

@RestController
@RequestMapping(Array("/service/record"))
class RecordController {

  @Inject
  var recordService: RecordService = _

  @RequestMapping(method = Array(RequestMethod.GET))
  @Transactional(readOnly = true)
  def list(@Valid filter: ListFilter) = {
    recordService.list(filter) map Record.transform
  }

  @RequestMapping(value = Array("{id}"), method = Array(RequestMethod.GET))
  @Transactional(readOnly = true)
  def get(@PathVariable("id") id: Long) =
    Record.transform(recordService.load(classOf[domain.Record])(id))

  @RequestMapping(value = Array("{id}"), method = Array(RequestMethod.POST))
  @Transactional
  def save(@PathVariable("id") id: jl.Long, @Valid @RequestBody form: Record) = {
    val record = Option(id).fold(new domain.Record)(recordService.load(classOf[domain.Record]))
    record.name = form.name
    record.number = form.number
    recordService.save(record)

    Record.transform(record)
  }

  @RequestMapping(method = Array(RequestMethod.POST))
  @Transactional
  def create(@Valid @RequestBody form: Record) = {
    save(null, form)
  }

  @RequestMapping(value = Array("{id}"), method = Array(RequestMethod.DELETE))
  @Transactional
  def delete(@PathVariable("id") id: Long) = {
    recordService.delete(recordService.load(classOf[domain.Record])(id))
    true
  }
}
