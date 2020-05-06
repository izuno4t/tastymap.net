package net.tastymap

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class TastymapApplication

fun main(args: Array<String>) {
	runApplication<TastymapApplication>(*args)
}
