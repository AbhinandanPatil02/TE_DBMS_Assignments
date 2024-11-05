



db.stu2.insertMany([
{
  "Roll_no":1,
  "Name":"Abhi",
  "subjects":[
    {"subject":"maths","marks":89},
    {"subject":"physic","marks":89},
  ]
},
{
  "Roll_no":2,
  "Name":"onkar",
  "subjects":[
    {"subject":"maths","marks":90},
    {"subject":"physic","marks":90},
  ]
}
]);


var mapfunction=function(){
this.subjects.forEach(subject=>{
  emit(this.Roll_no,subject.marks);
})
}


var reducefunction=function(key,value){
return Array.avg(value)
}

db.stu2.mapReduce(mapfunction,reducefunction,{'out':'ResultStu2'});

db.ResultStu2.find().pretty();

var reducefunction=function(key,value){
return Array.sum(value)
}


