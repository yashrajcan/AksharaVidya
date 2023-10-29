
import streamlit as st
import pickle
import pandas as pd
import numpy as np

pickle_in = open('dyslexia_model.pkl', 'rb')
disease = pickle.load(pickle_in)

def predict_dyslexia(language_vocab, memory, speed, visual_discrimination, audio_discrimination, survey_score):
    prediction = disease.predict([[language_vocab, memory, speed, visual_discrimination, audio_discrimination, survey_score]])
    return prediction

def main():
    st.title('Aksharavidya')
    st.sidebar.title('Hack the Mountains')
    st.sidebar.info("This project is for the hackathon in which we have made an app for the detection of dyslexia")
    st.info('Kindly fill values as per score')

    language_vocab = st.text_input('Vocab', 'Type here')
    memory = st.text_input('Memory', 'Type here')
    speed = st.text_input('Speed', 'Type here')
    visual_discrimination = st.text_input('Visual Discrimination', 'Type here')
    audio_discrimination = st.text_input('Audio Discrimination', 'Type here')
    survey_score = st.text_input('Survey Score', 'Type here')

    result = ''

    if st.button('Predict'):
        result = predict_dyslexia(language_vocab, memory, speed, visual_discrimination, audio_discrimination, survey_score)
        
    st.success('Your score is {}'.format(result))

if __name__ == '__main__':
    main()
