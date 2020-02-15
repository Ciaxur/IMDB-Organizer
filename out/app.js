"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// Module Imports
const fs = require("fs");
const jsdom_1 = require("jsdom");
// File Variables
const file = __dirname + '/data.html';
// Load File
fs.readFile(file, (err, data) => {
    // Error
    if (err)
        console.error(err);
    // File Read
    else {
        console.log("File Loaded Successfuly!");
        // Create a Virtual DOM Element
        const DOM = new jsdom_1.JSDOM(data);
        const document = DOM.window.document;
        const episodes = document.getElementsByClassName("info");
        // Get Show Data
        const outFile = document.getElementsByTagName('title')[0].innerHTML + '.txt';
        const eps = getEpisodes(episodes);
        // Output Episodes to Text File
        outputEpToText(eps, outFile)
            ? console.log(`Data save to "${outFile}" Successfully!`)
            : console.error(`Data Failed to Save`);
    }
});
/**
 * Gets all Episode Data Title & Number
 * @param episodes HTML Class Element Object for the 'info' Class
 * @returns An EpisodeData Object with the Episode number and Title
 */
function getEpisodes(episodes) {
    // Episode Data
    const EP_DATA = [];
    // Loop through each Child
    for (const e of episodes) {
        EP_DATA.push({ index: -1, title: "" }); // Create Empty Episode Data for each episode
        const EP = EP_DATA[EP_DATA.length - 1]; // Assign a Varaible to the Last Element in Array
        for (const child of e.children) {
            // Get Episode Number
            if (child.tagName === 'META')
                EP.index = child.getAttribute("content");
            // Get Episode Title
            else if (child.tagName === 'STRONG')
                EP.title = child.firstChild.textContent;
        }
    }
    return EP_DATA;
}
/**
 * Outputs each Episode Object to a file based on Episode Name Format
 *  "Episode # - Title"
 *
 * @param EP_LIST The EpisodeData Object Array of all Episodes
 * @param fileName The Output Text File Name
 * @returns Boolean indicating Success or failure
 */
function outputEpToText(EP_LIST, fileName) {
    if (!EP_LIST.length)
        return false; // Failed to Save if EP_LIST is empty
    // Convert Object into a string of data
    let str = "";
    for (const episode of EP_LIST) {
        str += `Episode ${episode.index} - ${episode.title}\n`;
    }
    // Output data to file
    fs.writeFile(__dirname + '/' + fileName, str, err => err ? console.error(err) : null);
    return true;
}
