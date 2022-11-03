<script>
    function handleClick(e){
        console.log("click:", e)
    }
</script>

<div class="">
    <h1 class="text-3xl font-bold underline m-2 p-2">Hello!</h1>
    <button 
        class="text-white rounded bg-blue-500 border-2 border-black w-16 hover:bg-blue-600 active:bg-blue-700 m-2 p-2"
        on:click={handleClick}>
        Hello!
    </button>
</div>
