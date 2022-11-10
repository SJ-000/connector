import { readable, writable } from 'svelte/store';
import rawData from "../assets/data.json";

let getNames = () => {
    let id = 0;
    let namesTmp = [];
    Object.entries(rawData).forEach(([k, v]) => {
        const vv = v["pdtv2"];
        if (!k.includes(".test]")) {
            namesTmp = [...namesTmp, { id: id, name: k, amount: vv.length }];
        }
    });
    return namesTmp;
}

export const names = writable(getNames());

export const getValuesPerName = (/** @type {string} */ name) => {
    let id = 0;
    let valuesInternal = [];
    let pdtv2 = rawData[name];
    const valuesTmp = pdtv2["pdtv2"];
    valuesTmp.forEach((/** @type {{ [x: string]: any; }} */ v) => {
        valuesInternal = [...valuesInternal, { id: id, category: v["category"], posn: v["posn"], msg: v["message"], }]
        id++;
    });
    values.set(valuesInternal);
}

export const values = writable([]);