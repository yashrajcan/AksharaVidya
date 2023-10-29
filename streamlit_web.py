import streamlit as st
import pickle
import pandas as pd 
import numpy as np 



pickle_in=open('dyslexia_model.pkl','rb')
disease=pickle.load(pickle_in)

def predict_dyslexia(language_vocab,memory,speed,visual_discrimination,audio_discrimination,survey_score):
    prediction=disease.predict([[language_vocab,memory,speed,visual_discrimination,audio_discrimination,survey_score]])
    print(prediction)
    return prediction    
 
def main():

    st.title('AksharaVidya')
    st.sidebar.title('Hack The Mountains')
    st.sidebar.info("This project is for \n hackathon in which\n we have made an\n app for the detection \n of dyslexia")
    st.info('kindly fill values as per score')

    language_vocab=st.text_input('vocab','type here')
    memory=st.text_input('memory','type here')
    speed=st.text_input('speed','type here')
    visual_discrimination=st.text_input('visual_discrimination','type here')
    audio_discrimination=st.text_input('audio_discrimination','type here')
    survey_score=st.text_input('survey score','type here')


    result=''


    if st.button('predict'):
        result=predict_dyslexia(language_vocab,memory,speed,visual_discrimination,audio_discrimination,survey_score)

    st.success('Your score is {}'.format(result))



if __name__=='__main__':
    main()
