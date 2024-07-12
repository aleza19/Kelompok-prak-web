@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');

body {
    font-family: 'Poppins', Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    background-color: rgb(234, 148, 214);
    padding: 50px;
}

nav {
    padding: 10px;
    background-color: black;
}

nav ul {
    padding: 10px;
    list-style: none;
    text-align: center;
}

nav ul li {
    display: inline;
    margin-right: 15px;
}

nav ul li a {
    text-decoration: none;
    color: black;
    padding: 5px 10px;
    background-color: white;
    border-radius: 2px;
}

.footer {
    background-color: black;
    padding: 50px;
    text-align: center;
    color: white;
}

@media screen and (min-width: 1000px) {
    .container {
        display: flex;
    }
}

.box-name {
    background-color: white;
    margin-right: 20px;
    padding: 40px;
    width: 550px;
    text-align: center;
    border-radius: 10px;
}

.box-name img {
    width: 45%;
}

.box-name .name {
    font-size: 2.5em;
    font-weight: bold;
    margin-top: 10px;
}

.box-name .skills {
    font-size: 1.5em;
    font-weight: bold;
    margin-top: 5px;
    color: #888;
}

.box-detail {
    border-radius: 10px;
    background-color: white;
    padding: 70px;
}

.detail-profile {
    margin-top: 20px;
}

.form-detail td {
    padding-right: 20px;
}

.medsos {
    margin-top: 20px;
}

@media screen and (max-width: 1000px) {
    .container {
        margin: 0px auto;
        flex-direction: column;
    }

    .box-name {
        margin-right: 0;
        margin-bottom: 20px;
        width: auto;
    }

    .box-detail {
        padding: 20px;
    }
}

footer {
    background-color: black;
    color: white;
    padding: 50px;
    text-align: center;
}

footer h2,
footer h5 {
    margin: 0;
}
