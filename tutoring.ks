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
		    name: { type: "CharField", length: 64 }
		},
		admin: "%name",
		listing: "%name% is in a list",
		display: "%name% is being displayed"
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
    }

},

pages: {
    search: {
	title: "Search for a tutor",
	url: "",
	template: f"search.html"
    },
    
    add: {
	title: "Add a tutor",
	url: "add/",
	template: f"Add.html",
	createTutor: expr { 
	    title: "Add a tutor to the database",
	    expr: F[](tutor->Tutor) 
	}
    }

},

database: {                
    name: "tutors.db",
    engine: "django.db.backends.sqlite3"
}
