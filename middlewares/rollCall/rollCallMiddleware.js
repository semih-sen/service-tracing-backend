const pool = require("../../helpers/database/database")


const controlRollCall = (req,res,next)=>{
    let body = req.body;
    pool.query(`SELECT * FROM public."rollcalls" where "studentid"=$1 and "type"=$2 and "datetime">(SELECT NOW() - interval '15 minutes' limit 1)`, [body.studentId,body.type],(err,result)=>{
        if(err){
            console.error(err);
        }
        else{
            
            if(result.rowCount>0){
                pool.query('UPDATE public."rollcalls" SET "status"=$1 WHERE "id"=$2',[body.status,result.rows[0].id],(err,result2)=>{
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
    controlRollCall
}