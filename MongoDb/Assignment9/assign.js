
db.Mycollection.find({
    $and : [
        {Roll_no : {$lte:4}},
        {"Name":"Onkar"}
    ]}
)


