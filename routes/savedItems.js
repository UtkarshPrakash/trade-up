const express = require("express");
const router = express.Router();
const { saveItem, getSavedItems, removeSavedItem } = require("../controllers/savedItemController");

router.post("/", saveItem);
router.get("/:user_id", getSavedItems);
router.delete("/", removeSavedItem);

module.exports = router;