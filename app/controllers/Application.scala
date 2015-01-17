package controllers

import play.api.mvc.Action
import play.api.mvc.Controller
import play.api.db.DB
import anorm._
import anorm.SqlParser._
import play.api.Play.current

object Application extends Controller {

  def index = Action { request =>
    val data = DB.withConnection { implicit connection =>
      SQL("SELECT table_name FROM information_schema.tables WHERE table_type = 'BASE TABLE'     AND table_schema = 'public' ORDER BY table_type, table_name").
        as(scalar[String] *)
    }
    Ok(views.html.index(data.mkString("\n")))
  }

}