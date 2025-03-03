window.onload = () => {
    document.getElementById("submit").addEventListener("click", (e) => {
        e.preventDefault();

        const nameRe = /^[A-Za-z\-]{1,32}$/;
        const emailRe = /^([_A-Za-z\d\.\-]+)@([_A-Za-z\d\.\-]+)\.[A-Za-z]{2,5}$/;
        const Name = document.getElementById("name").value;
        const Email = document.getElementById("email").value;


        if (nameRe.test(Name) === false || emailRe.test(Email) === false){
            if (nameRe.test(Name) === false){
                document.getElementById("invalid").innerHTML = "Please check the Name entered. ";
            }
            if (emailRe.test(Email) === false)  {
                document.getElementById("invalid").innerHTML += "Please check the Email entered.";
            }
            location.reload;
        }

    

        const data = {
            "name": Name,
            "email": Email
        }


        fetch("http://mudfoot.doc.stu.mmu.ac.uk/node/api/mailinglist", {
                method: "post",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })


            .then((response) => {
                if (response.status === 200) {
                    return response.json();
                } else if (response.status === 400) {
                    throw "Information entered does not seem valid";
                } else {
                    throw response.statusText;
                }
            })


            .then(obj => {
                document.getElementById("output").innerHTML = "Thank you " + obj.data.name + ", you have been successfully signed up!";
            })


            .catch(err => {
                document.getElementById("output").innerHTML = err;
            })

    });

}