<script>
    import data from "./assets/data.json";

    function handleClick(e) {
        console.log("click:");
    }

    // console.log(data, typeof(data));
    // console.log(data['github.com/bountylabs/service/guest/dynamo'])
    // console.log(typeof(data['github.com/bountylabs/service/guest/dynamo']))
    Object.entries(data).forEach(([k, v]) => {
        console.log(k);
        const vv = v["pdtv2"];
        console.log(vv.length);
        console.log(vv);
        vv.forEach((vvv) => {
            console.log("category: ", vvv["category"]);
            console.log("posn: ", vvv["posn"]);
            console.log("msg: ", vvv["message"]);
        });
    });

    // const _data = JSON.parse(data.toString());
    // _data.forEach(d => {
    //     console.log(d)
    // })
</script>

<div class="">
    <h1 class="text-3xl font-bold underline m-2 p-2">Hello!</h1>
    <button
        class="text-white rounded bg-blue-500 border-2 border-black w-16 hover:bg-blue-600 active:bg-blue-700 m-2 p-2"
        on:click={handleClick}
    >
        Hello!
    </button>
</div>

<div>
    <ul class="list-disc">
        {#each Object.entries(data) as item}
            <li>
                <p>{item.values["pdtv2"]}</p>
            </li>
        {/each}
    </ul>
</div>
