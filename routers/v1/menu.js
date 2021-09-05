const express = require("express");
const router = express.Router();

router.get("", (req, res) => {
  res.json([
    {
      id: 1,
      name: "Ana Menü",
      value: "",
    },
    {
      id: 2,
      name: "Öğrenciler",
      value: "students",
    },
    
    {
      id: 3,
      name: "Servisler",
      value: "services",
    },{
      id: 4,
      name: "Servis Çalışanları",
      value: "employees",
    },
    {
      id: 5,
      name: "Servis Firmaları",
      value: "companies",
    },

    {
      id: 6,
      name: "Raporlar",
      value: "reports",
    },
    
  ]);
});

module.exports = router;
