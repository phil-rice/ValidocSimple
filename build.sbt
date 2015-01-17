import com.typesafe.sbteclipse.plugin.EclipsePlugin.EclipseKeys

name := """validoc Simple Test"""

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.4"
//scalaVersion := "2.10.4"

unmanagedResourceDirectories in Test <+=  baseDirectory ( _ /"target/web/public/test" )

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache,
  ws
)

libraryDependencies +=  "postgresql" % "postgresql" % "9.1-901-1.jdbc4"

EclipseKeys.withSource := true