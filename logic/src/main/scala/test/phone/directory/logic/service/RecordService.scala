package test.phone.directory.logic.service

import org.springframework.stereotype.Service
import test.phone.directory.logic.model.domain.Record
import test.phone.directory.logic.support.ListFilter
import org.hibernate.criterion.Restrictions._
import org.hibernate.criterion.Order

@Service
class RecordService extends AbstractDataService[Record] {

  def list(filter: ListFilter) = {
    val c = session.createCriteria(classOf[Record])

    for (search ← Option(filter.search)) c.add(or(ilike("name", "%"+search+"%"), ilike("number", "%"+search+"%")))

    c.addOrder(Order.asc("name"))
    c.addOrder(Order.asc("number"))

    query[Record](c)
  }
}
