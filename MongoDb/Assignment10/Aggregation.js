



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


