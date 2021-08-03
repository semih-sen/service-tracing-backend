const jwt = require("jsonwebtoken");
const {
  isTokenIncluded,
  getAccesTokenFromHeader,
} = require("../../helpers/auth/tokenHelper");

const getAccesToRouteForSuperAdmins = (req, res, next) => {
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
  }
  const access_token = getAccesTokenFromHeader(req);

  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
    }
    
    if (!err) {
      if (decoded.role === "SuperAdmin") {
        next();
      } else {
        res.status(403).json({ message: "You are not acces this route" });
      }
    }
  });
};

const getAccesToRouteForAdminsEmployeesAndParents=(req,res,next)=>{
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
    return;
  }
  const access_token = getAccesTokenFromHeader(req);

  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
      return;
    }
    if (!err) {
      if (
        decoded.role === "Employee" ||
        decoded.role === "Manager" ||
        decoded.role === "Parent"
      ) {
        next();
      } else {
        res.status(403).json({ message: "You are not acces this route" });
      }
    }
  });
}

const getAccesToRouteForSuperAdminsAndAdmins = (req, res, next) => {
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
  }
  const access_token = getAccesTokenFromHeader(req);

  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
      return;
    }

    if (!err) {
      if (decoded.role === "SuperAdmin" || decoded.role === "Manager") {
        next();
      } else {
        res.status(403).json({ message: "You are not acces this route" });
      }
    }
  });
};

const getAccesToRouteForAdmins = (req, res, next) => {
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
  } else {
    const access_token = getAccesTokenFromHeader(req);

    jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
      if (err) {
        res.status(401).json({ message: err.message });
      }
   
      if (!err) {
        if (decoded.role === "Manager") {
          next();
        } else {
          res.status(403).json({ message: "You are not acces this route" });
        }
      }
    });
  }
};

const getAccesToRouteForEmployees = (req, res, next) => {
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
  } else {
    const access_token = getAccesTokenFromHeader(req);

    jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
      if (err) {
        res.status(401).json({ message: err.message });
      }
    
      if (!err) {
        if (decoded.role === "Employee") {
          next();
        } else {
          res.status(403).json({ message: "You are not acces this route" });
        }
      }
    });
  }
};

const getAccesToRouteForAdminsAndEmployees = (req, res, next) => {
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
    return;
  }
  const access_token = getAccesTokenFromHeader(req);

  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
      return;
    }
    
    if (!err) {
      if (decoded.role === "Employee" || decoded.role === "Manager") {
        next();
      } else {
        res.status(403).json({ message: "You are not acces this route" });
      }
    }
  });
};
const getAccesToRouteForSuperAdminsAdminsAndEmployees = (req, res, next) => {
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
    return;
  }
  const access_token = getAccesTokenFromHeader(req);

  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
      return;
    }
    if (!err) {
      if (
        decoded.role === "Employee" ||
        decoded.role === "Manager" ||
        decoded.role === "SuperAdmin"
      ) {
        next();
      } else {
        res.status(403).json({ message: "You are not acces this route" });
      }
    }
  });
};

const getAccesToRouteForParents = (req, res, next) => {
  const { JWT_SECRET_KEY } = process.env;

  if (!isTokenIncluded(req)) {
    res.status(401).json({
      message: "Your token is not valid",
    });
    return;
  }
  const access_token = getAccesTokenFromHeader(req);

  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
      return;
    }
    if (!err) {
      if (
        decoded.role === "Parent"
      ) {
        next();
      } else {
        res.status(403).json({ message: "You are not acces this route" });
      }
    }
  });
};

module.exports = {
  getAccesToRouteForSuperAdmins,
  getAccesToRouteForSuperAdminsAndAdmins,
  getAccesToRouteForAdmins,getAccesToRouteForEmployees,
  getAccesToRouteForAdminsAndEmployees,
  getAccesToRouteForSuperAdminsAdminsAndEmployees,
  getAccesToRouteForParents,getAccesToRouteForAdminsEmployeesAndParents
};
