



db.Mycollection.aggregate([

   { 
        $group :{
            _id:null,
            averageofRoll_no:{
                $avg: "Roll_no"
            }

        }
    }   
    
]);

db.Mycollection.aggregate([ { $match : {$and :[ {"Branch" :"CS"} , {"Name" :"Abhi"}]}}]);


db.Mycollection.aggregate([ { $match: { "Branch": "CS" } }, { $project: { Name: 1, Roll_no: 1 } }] );


db.Mycollection.aggregate([
     {
               $match :{
                    Branch :"CS"
                }
     },
        {
               $count : 'CS Branch Students'
        }]);


db.Mycollection.aggregate ([ {$group :{ _id : "$Branch" , count : { $sum :1}}}]);






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





db.practiceAgg.aggregate([
    { $unwind: "$Marks" },
    {
      $group: {
        _id: "$Roll_no",
        Name:{$first:"$Name"},
        avgmarks: { $avg: { $getField: { field: "v", input: { $arrayElemAt: [ { $objectToArray: "$Marks" }, 0 ] } } } }
      }
    },
    {
        $match:{
            avgmarks:{$gt:75}
        }
    }
  ]);
  


db.practiceAgg.aggregate([
    {
        $unwind: "$Marks"
    }
    ,
    {
        $group:{
            _id:"$Roll_no",
            Name:{$first:"$Name"},
            MathsMarks:{
                $first:"$Marks.Maths"
            }
        }
    },
    {
        $match:{

            MathsMarks:{$gt:75}
        }
    }
]);

db.practiceAgg.aggregate([
    {
        $unwind:"Marks"
    },
    {
        $group:{
            _id:null,
            avgofm:{$avg:"Marks.Maths"}
        }
    }
]);























