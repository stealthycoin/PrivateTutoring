website: {
    name: "privatetutors",
    prettyName: "<img src='{{ STATIC_URL }}images/mlclogo2.png' width='144px' height='72px'>Private Tutor Database",
    author: "John Carlyle",
    theme: "dreamcloud"
},

apps: {
    tutor: {
	models: {
	    Tutor: {
		fields: {
		    name: CharField { length: 64 },
		    gender: ForeignKey { link: "'Sex'" },
		    calculators: ManyToManyField { link: "'Calculator'" },
		    yearsExp: SmallIntegerField { label: "Years of Experience" }
		},
		admin: "%name",
		listing: "<a href='/tutor/%pk%'>%name%</a>",
		display: "<div class='box'><h2>%name%</h2><p>Gender: %gender%<p><p>Calculators: %calculators%</p><p>Years Tutoring: %yearsExp%</div>"
	    },

	    Sex: {
		fields: {
		    name: CharField { length: 6 }
		},
		admin: "%name"
	    },

	    Calculator: {
		fields: {
		    name: CharField { length: 64 }
		},
		admin: "%name"
	    }
	}
    }
},

menu: {
    search: {
	title: "Search",
	link: "/",
	placement: 1
    },
    
    add: { 
	title: "Add a Tutor",
	link: "/add/",
	placement: 2
    },
    
    all: {
	title: "All Tutors",
	link: "/all/",
	placement: 3
    }

},

pages: {
    search: {
	title: "Search for a tutor",
	url: "",
	template: f"search.html",
	searchField: expr {
	    title: "Find a tutor",
	    result: "searchResults", //this specifies where to stick the results
	    expr: SF[](tutor->Tutor)
	}
    },
    
    add: {
	title: "Add a tutor",
	url: "add/",
	template: f"add.html",
	createTutor: expr { 
	    title: "Add a tutor to the database",
	    expr: F[](tutor->Tutor) 
	}
    },

    all: {
	title: "All tutors",
	url: "all/",
	template: "<div class='box'><h2>List of all tutors</h2>%allTutors%</div>",
	allTutors: expr {
	    title: "Listing of all tutors",
	    expr: S[](tutor->Tutor)
	}
    },

    tutor: {
	title: "Tutor Information",
	url: "tutor/(\\d)/",
	template: "%singleTutor%",
	singleTutor: expr {
	    title: "Tutor information",
	    expr: S[pk="%1"](tutor->Tutor)
	}
    }

},

database: {                
    name: "tutors.db",
    engine: "django.db.backends.sqlite3"
}
