import express from 'express';
import cors from 'cors';
import path from 'path';
import routes from './routes';
import {errors} from 'celebrate';
import { config } from 'dotenv';

const app = express();

app.use(cors());

app.use(express.json());
app.use(routes);

app.use('/uploads', express.static(path.resolve(__dirname, '..', 'uploads')));

app.use(errors());

config();

app.listen(process.env.PORT, () => {
    console.log(`Server started on port ${process.env.PORT}! 😎`);
});
