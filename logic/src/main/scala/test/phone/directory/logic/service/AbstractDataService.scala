package test.phone.directory.logic.service

import javax.inject.Inject
import org.hibernate.{Criteria, LockOptions, Session, SessionFactory}
import org.springframework.transaction.PlatformTransactionManager
import test.phone.directory.logic.model.domain.BaseEntity
import scala.reflect.ClassTag
import org.springframework.transaction.interceptor.TransactionAspectSupport
import org.hibernate.criterion.CriteriaSpecification
import org.springframework.orm.ObjectRetrievalFailureException
import collection.JavaConverters._

abstract class AbstractDataService[E <: BaseEntity] {
  @Inject
  val sessionFactory: SessionFactory = null

  @Inject
  val transactionManager: PlatformTransactionManager = null

  def session: Session = sessionFactory.getCurrentSession

  def get[T <: E](entity: Class[T])( id: T#Identifier): Option[T] =
    Option(session.get(entity, id.asInstanceOf[java.io.Serializable]).asInstanceOf[T])

  def load[T <: E](entity: Class[T])( id: T#Identifier): T = get(entity)(id) match {
    case Some(o: T) => o
    case None => throw new ObjectRetrievalFailureException(entity, id)
  }

  def save[T <: E](obj: T): T = {
    val session = this.session
    val objToSave = obj.id match {
      case null => obj
      case _ => session.merge(obj).asInstanceOf[T]
    }
    session.saveOrUpdate(objToSave)
    objToSave
  }

  def delete[T <: E](obj: T) {
    session.delete(obj)
  }

  def query[T](c: Criteria): Set[T] =
    c.list().asInstanceOf[java.util.List[T]].asScala.toSet
}
