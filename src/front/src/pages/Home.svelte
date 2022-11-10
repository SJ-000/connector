<script>
    // import { append } from "svelte/internal";
    import { router } from "tinro";
    import data from "../assets/data.json";

    function handleClick(e) {
        console.log("run for all");
    }

    // console.log(data, typeof(data));
    // console.log(data['github.com/bountylabs/service/guest/dynamo'])
    // console.log(typeof(data['github.com/bountylabs/service/guest/dynamo']))

    let id = 0;
    let keys = [];

    Object.entries(data).forEach(([k, v]) => {
        // console.log(k);
        const vv = v["pdtv2"];
        // console.log(vv.length);
        // console.log(vv);
        vv.forEach((vvv) => {
            // console.log("category: ", vvv["category"]);
            // console.log("posn: ", vvv["posn"]);
            // console.log("msg: ", vvv["message"]);
        });
        if (!k.includes(".test]")) {
            // console.log("k: ", k);
            keys = [...keys, { id: id, name: k, amount: vv.length }];
        }
    });
    // console.log("keys: ", keys);

    // const _data = JSON.parse(data.toString());
    // _data.forEach(d => {
    //     console.log(d)
    // })
</script>

<main class="m-2 p-2">
    <div class="flex space-x-4">
        <h1 class="text-3xl font-bold">Root</h1>
        <button on:click={handleClick}> Run for all </button>
    </div>

    <div class="ml-4 mt-1">
        <ul class="list-disc">
            {#each keys as item}
                <li>
                    <p>
                        {item.name}
                        ({item.amount})
                        <button
                            on:click={(e) => {
                                console.log(item.name);
                                const name = item.name.toString();
                                // router.goto("/details");
                                router.goto("/details/?q=".concat(name));
                            }}>Open</button
                        >
                    </p>
                </li>
            {/each}
        </ul>
    </div>
</main>
