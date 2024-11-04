

// Mycollection


[
    {
      _id: ObjectId('671e0448017c7a340d86b01d'),
      Name: 'Abhi',
      Roll_no: 45,
      Branch: 'CS'
    },
    {
      _id: ObjectId('671e0448017c7a340d86b01e'),
      Name: 'Sahil',
      Roll_no: 2,
      Branch: 'CS'
    },
    {
      _id: ObjectId('671e3027017c7a340d86b01f'),
      Name: 'Aniruddha',
      Roll_no: 3,
      Branch: 'CS'
    },
    {
      _id: ObjectId('671e3027017c7a340d86b021'),
      Name: 'Onkar',
      Roll_no: 5,
      Branch: 'CS'
    },
    {
      _id: ObjectId('671e3027017c7a340d86b022'),
      Name: 'Ganesh',
      Roll_no: 6,
      Branch: 'ENTC'
    }
  ]


var mapfunction = function(){emit(this.Name,this.Roll_no)};

var reducefunction= function(key,val){return Array.sum(val)};

db.Mycollection.mapReduce(mapfunction,reducefunction,{'out':'Result_mapReduce'});

// it is like a $group  that groups accorging to the Name (1ST parameter )and calculate the result by doing operation on the val  
db.Mycollection.insertOne( {
    "Name" :"Abhi",
    "Roll_no" :55,
    "Branch":"Entc"});
    
    db.Mycollection.mapReduce(mapfunction,reducefunction,{'out':'Result_mapReduce'});


    db.Result_mapReduce.find();
    [
      { _id: 'Aniruddha', value: 3 },
      { _id: 'Abhi', value: 100 },
      { _id: 'Ganesh', value: 6 },
      { _id: 'Onkar', value: 5 },
      { _id: 'Sahil', value: 2 }
    ]
    
var mapfunction = function(){emit(null,this.Roll_no)}; 

var reducefunction= function(key,val){return Array.avg(val)};


db.Mycollection.mapReduce(mapfunction,reducefunction,{query:{Roll_no:{$lt:4}},'out':'Result_mapReduce1'});
db.Result_mapReduc1.find();










db.practiceAgg.insertMany([
  {
      "Roll_no":1,
      "Name": "Abhinandan",
      "Marks":[
          {"Maths":98},{"Chemistry":90},{"Physics":85}
      ],
      "fav_game":"Cricket",
      "Phone_no":12345678

  },
  {
      "Roll_no":2,
      "Name": "Virat",
      "Marks":[
          {"Maths":90},{"Chemistry":89},{"Physics":55}
      ],
      "fav_game":"kho-kho",
      "Phone_no":12345678

  },
  {
      "Roll_no":3,
      "Name": "Rohit",
      "Marks":[
          {"Maths":28},{"Chemistry":85},{"Physics":15}
      ],
      "fav_game":"Cricket",
      "Phone_no":12345678

  },
  {
      "Roll_no":4,
      "Name": "Thala",
      "Marks":[
          {"Maths":70},{"Chemistry":70},{"Physics":70}
      ],
      "fav_game":"Cricket",
      "Phone_no":12345678

  },
  {
      "Roll_no":5,
      "Name": "Hardik",
      "Marks":[
          {"Maths":77},{"Chemistry":40},{"Physics":65}
      ],
      "fav_game":"Cricket",
      "Phone_no":12345678
  },

]
)



var mapfunction= function(){emit(this.Roll_no,this.Phone_no)};
var reducefunction =function (key,val){return Array.avg(val)};
db.practiceAgg.mapReduce(mapfunction,reducefunction,{'out':"ResultOfMpr"});
db.practiceAgg.mapReduce(mapfunction,reducefunction,{query:{Roll_no:{$gte:3}}  ,'out':"ResultOfMpr"});


// aum and avg

db.ResultOfMpr.find();

