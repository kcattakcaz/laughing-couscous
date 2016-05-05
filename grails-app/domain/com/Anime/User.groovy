package com.Anime

import anime.Favorite
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	static hasMany =  [favorites: Favorite]
	String username
	String password
	String email
	Integer score
	Integer num_reviews
	Integer num_comments
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password, String email) {
		this()
		this.username = username
		this.password = password
		this.email = email
		this.score = 0
		this.num_reviews = 0
		this.num_comments = 0
	}

	def addPoints(Integer points) {
		score += points
	}

	def addReview() {
		num_reviews++
	}
	def addComment() {
		num_comments++
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email blank: false, unique: true
	}

	static mapping = {
		password column: '`password`'
	}
}
