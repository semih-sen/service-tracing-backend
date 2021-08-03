const pool = require("../../helpers/database/database")


const controlTransportation = (req,res,next)=>{
    let body = req.body;
    pool.query(`SELECT * FROM public."Transportations" where "studentId"=$1 and "type"=$2 and "datetime">(SELECT NOW() - interval '15 minutes' limit 1)`, [body.studentId,body.type],(err,result)=>{
        if(err){
            console.error(err);
        }
        else{
            
            if(result.rowCount>0){
                pool.query('UPDATE public."Transportations" SET "isOutOfAddress"=$1 WHERE "id"=$2',[body.isOutOfAddress,result.rows[0].id],(err,result2)=>{
                    if(err){
                        console.error(err);
                    }
                    else{
                        res.status(200).json({
                            message: "Succesfully updated"
                        })
                    }
                })
            }
            else{
               
                next();
            }
        }
    });
}

module.exports ={
    controlTransportation
}