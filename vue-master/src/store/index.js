import Vue from "vue";
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
    state:{
        currentPathName: ''
    },
    mutations:{
        logout(){
            localStorage.removeItem("user")
            localStorage.removeItem("menus")
        }
    },
    actions:{

    },
    getters:{

    },
    modules:{

    }
})

export default store;