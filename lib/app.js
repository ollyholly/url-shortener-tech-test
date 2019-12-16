submitForm(){
  axios
  .post("localhost:4000/")
  .then(res => {
    //We don't have to parse the JSON!
    console.log(res.data);
  })
  .catch(err => {
    console.log("IN CATCH CALLBACK!!!");
    console.log(err);
  });


}