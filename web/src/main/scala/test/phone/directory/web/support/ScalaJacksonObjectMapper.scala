package test.phone.directory.web.support

import org.springframework.stereotype.Component
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule

@Component("scalaJacksonObjectMapper")
class ScalaJacksonObjectMapper extends ObjectMapper {
  registerModule(DefaultScalaModule)
}
