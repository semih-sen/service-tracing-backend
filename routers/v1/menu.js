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
      name: "Veliler",
      value: "parents",
    },
    {
      id: 4,
      name: "Servisler",
      value: "services",
    },{
      id: 5,
      name: "Servis Çalışanları",
      value: "employees",
    },
    {
      id: 6,
      name: "Servis Firmaları",
      value: "companies",
    },

    {
      id: 7,
      name: "Raporlar",
      value: "reports",
    },{
      id: 8,
      name: "Hakkında",
      value: "about",
    },
    
  ]);
});

module.exports = router;
