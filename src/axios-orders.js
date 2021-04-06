import axios from 'axios';

const instance = axios.create({
    baseURL: 'https://burgerapp-204a7-default-rtdb.firebaseio.com/'
});

export default instance;