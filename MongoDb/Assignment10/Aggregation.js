
// $match $group $project $sort $limit $skip $unwind $lookup $addFields $merge

// $toLower / $toUpper 

// $sum: Sums values for a group of documents.
// $avg: Calculates the average for a group of documents.
// $min / $max: Finds the minimum/maximum value in a group.
// $push: Adds values to an array.




db.student2.insertMany(
    [
      {
        "Roll_no":1,
        "Name":"Abhi",
        "Marks":95,
        "Fav_game":"Cricket"
      },
      {
        "Roll_no":2,
        "Name":"Virat",
        "Marks":85,
        "Fav_game":"Chess"
      },
      {
        "Roll_no":3,
        "Name":"Rohit",
        "Marks":75,
        "Fav_game":"Kho-Kho"
      },
      {
        "Roll_no":4,
        "Name":"Thala",
        "Marks":77,
        "Fav_game":"Cricket"
      },
      {
        "Roll_no":5,
        "Name":"Hardik",
        "Marks":80,
        "Fav_game":"Cricket"
      },
      {
        "Roll_no":6,
        "Name":"Kunal",
        "Marks":84,
        "Fav_game":"Kabaddi"
      },
      {
        "Roll_no":7,
        "Name":"Narendra",
        "Marks":56,
        "Fav_game":"Stock-Market"
      },
      {
        "Roll_no":8,
        "Name":"Rahul",
        "Marks":35,
        "Fav_game":"Cricket"
      },
      {
        "Roll_no":9,
        "Name":"Carry",
        "Marks":45,
        "Fav_game":"Cricket"
      },
      {
        "Roll_no":10,
        "Name":"Ravindra",
        "Marks":89,
        "Fav_game":"Cricket"
      },
    ]
  );
  
  
  db.student2.insertOne({
    "Roll_no":12,
    "Name":"Satish",
    "Marks":[{"Maths":50},{"Physics":87},{"Chemistry":88}],
    "Fav_game":"Kabaddi"
  })
  
  
  
  // -----------------------------------------------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------------------------------------------
  db.student2.find({},{Roll_no:1,Name:1}).limit(2);
  [
    {
      _id: ObjectId('6728a366ffd101a3da86b01d'),
      Roll_no: 1,
      Name: 'Abhi'
    },
    {
      _id: ObjectId('6728a366ffd101a3da86b01e'),
      Roll_no: 2,
      Name: 'Virat'
    }
  ]
  
  




// $match $group $project $sort $limit $skip $unwind $lookup $addFields $merge

// $toLower / $toUpper 

// $sum: Sums values for a group of documents.
// $avg: Calculates the average for a group of documents.
// $min / $max: Finds the minimum/maximum value in a group.
// $push: Adds values to an array.


//  sum max min avg 

// marks gt 50 
db.student2.aggregate([
    {
        $match:{
            Marks:{$gt:50}
        }
    }
]);

//Avg of marks
// marks : [{"maths":52},{}]
db.student2.aggregate([
    {
        $unwind:"$Marks"
    },
    {
        $group:{
            _id: null,
            avgmarks:{
                $avg:"$Marks"
            }
        }
    }

]);

// sum of all marks
db.student2.aggregate(
    [
        {
            $unwind:"$Marks"
        },
        {
            $group:{
                _id:null,
                sumvalue:{$sum:"$Marks"}
            }
        }
    ]
);

// minimum marks
db.student2.aggregate([
    {
        $unwind: "$Marks"
    },
    {
        $group:{
            _id:null,
            // Name:{$first:"$Name"},
            minval:{$min:"$Marks"}
        }
    }
]);


// find out the array that contains  names of student who like cricket 
db.student2.aggregate([
    {
        $match:{
            "Fav_game":"Cricket"
        }
    },
    {
        $group:{
            _id:null,
            array:{$push:"$Name"}
        }
    }
]);


// sort the elements according to their marks
db.student2.aggregate([
    {
        $unwind:"$Marks"
    },
    {
        $sort:{
            "Marks":-1
        }
    },
    {
        $project:{
            Name:1,
            marks:1
        }
    }
]);


//maximum marks
db.student2.aggregate([
    {
        $unwind:"$Marks"
    },
    {
        $group:{
            _id:null,
            maxmarks:{$max:"$Marks"}
        }
    }
]);

// no of students who likes cricket

db.student2.aggregate([
    {
        $match:{
            "Fav_game":"Cricket"
        }
    },
    {
        $group:{
            _id:null,
            count:{$sum:1}
        }
    }
]);


// no of students who likes kabaddi,kho-kho,chess

db.student2.aggregate([
    {
        $match:{
            "Fav_game":{$in:["kabaddi","kho-kho","chess"]}
        }
    },
    {
        $group:{
            _id:null,
            count :{$sum:1}
        }
    }
    
]);



// display top 5  student marks with highest value
db.student2.aggregate([
    {
        
        $sort:{"Marks":-1}
         
    },
    {
        $project:{
            Name:1,
            Marks:1
        }
    },
    {
        $group:{
            _id:"$Name",
            marks:{$push:"$Marks"}
        }
    },
    {
        $limit:5
    }
]);



db.student2.aggregate([
    {
        $group:{
            _id:null,
            count:{$sum:1}
        }
    }
]);


db.student2.aggregate([
        //  {
        //      $unwind:"$Marks"
        //  },
        //  {
        //      $group:{
        //          _id: "$Roll_no",
        //          avgmarks:{
        //              $avg:"$Marks"
        //          }
        //      }
        //  },
         {
            $sort:{"Roll_no":-1}
         }
         
    
 ]);



 db.student2.aggregate([
    {
        $match:{
            "Fav_game":"Cricket"
        }
    },
    {
        $count:"Fav_game"
    }
 ]);









