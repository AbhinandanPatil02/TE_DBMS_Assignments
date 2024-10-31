db.Mycollection.find({},{Name :1 ,Roll_no:1});
[
  {
    _id: ObjectId('671e0448017c7a340d86b01d'),
    Name: 'Abhi',
    Roll_no: 45
  },
  {
    _id: ObjectId('671e0448017c7a340d86b01e'),
    Name: 'Sahil',
    Roll_no: 2
  },
  {
    _id: ObjectId('671e3027017c7a340d86b01f'),
    Name: 'Aniruddha',
    Roll_no: 3
  },
  {
    _id: ObjectId('671e3027017c7a340d86b021'),
    Name: 'Onkar',
    Roll_no: 5
  },
  {
    _id: ObjectId('671e3027017c7a340d86b022'),
    Name: 'Ganesh',
    Roll_no: 6
  },
  {
    _id: ObjectId('671f292c42ec51eb4986b01d'),
    Name: 'Abhi',
    Roll_no: 55
  }
]
// te31353_mongo_db>



db.student.insertMany(
    [
        {
            "NAME": "Abhi",
            "Roll_no":1,
            "Marks":89,
            "fav_game":"Cricket"
        },
        {
            "NAME": "Sahil",
            "Roll_no":2,
            "Marks":79,
            "fav_game":"Kho-kho"
        },
        {
            "NAME": "Aniruddha",
            "Roll_no":3,
            "Marks":69,
            "fav_game":"Chess"
        },
        {
            "NAME": "Ganesh",
            "Roll_no":4,
            "Marks":59,
            "fav_game":"Chess"
        },
        {
            "NAME": "Onkar",
            "Roll_no":5,
            "Marks":65,
            "fav_game":"Kabaddi"
        }
    ]
)


db.student.insertMany(
    [
        {
            "NAME": "Ganesh",
            "Roll_no":4,
            "Marks":59,
            "fav_game":"Chess"
        },
        {
            "NAME": "Onkar",
            "Roll_no":5,
            "Marks":65,
            "fav_game":"Kabaddi"
        }
    ]
);



db.student.updateOne(
    {"Roll_no":5},
    {
        $set:{
        "fav_game":"NoGAME"
    }
}
);



db.student.find({"Roll_no":5}).pretty();
[
  {
    _id: ObjectId('6721cb59196e930c4d86b021'),
    NAME: 'Onkar',
    Roll_no: 5,
    Marks: 65,
    fav_game: 'NoGAME'
  }
]


db.student.deleteOne({"Roll_no":5});

db.student.deleteMany(

    {"Roll_no": {$gt : 4},"NAME":"Onkar"}

)




db.student.updateMany(
    {"Roll_no":{$gte:5}},
    {$set : {"marks":100}}
);











