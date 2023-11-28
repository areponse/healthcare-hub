SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `healthcare_hub`
--

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `symptoms` text NOT NULL,
  `drugs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `uses` text DEFAULT NULL,
  `side_effects` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `flashcards`
--

CREATE TABLE `flashcards` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `diseases` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `well_being_tips`
--

CREATE TABLE `well_being_tips` (
  `id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `tip` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--- DATA

--
-- Data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`, `description`, `symptoms`, `drugs`) VALUES
(11, "Influenza", "Influenza, commonly known as the flu, is a highly contagious respiratory illness caused by influenza viruses. It typically presents with symptoms such as fever, headache, and fatigue. In severe cases, it can lead to complications such as pneumonia.", "Fever, Headache, Fatigue", "Aspirin, Ibuprofen"),
(12, "Hypertension", "Hypertension, or high blood pressure, is a common condition in which the long-term force of the blood against the artery walls is consistently too high. It often develops over the years and can lead to serious health problems, including heart disease and stroke. Symptoms may include headache, fatigue, and chest pain.", "Headache, Fatigue, Chest Pain", "Lisinopril, Amlodipine"),
(13, "Diabetes Mellitus", "Diabetes Mellitus is a group of metabolic disorders characterized by high blood sugar levels over an extended period. It results from the body\'s inability to produce or effectively use insulin. Common symptoms include frequent urination, fatigue, and blurred vision. Management involves medications like Metformin and insulin.", "Frequent Urination, Fatigue, Blurred Vision", "Metformin, Insulin"),
(14, "Migraine", "Migraine is a type of headache that involves severe pain, often accompanied by nausea and sensitivity to light and sound. It can be debilitating and last for hours to days. Migraine-specific medications like Ibuprofen and Sumatriptan are commonly used for relief.", "Headache, Nausea, Sensitivity to Light", "Ibuprofen, Sumatriptan"),
(15, "Asthma", "Asthma is a chronic condition characterized by inflammation of the airways, leading to difficulty breathing. Common symptoms include shortness of breath, wheezing, and chest tightness. Management involves medications such as Albuterol and Fluticasone.", "Shortness of Breath, Wheezing, Chest Tightness", "Albuterol, Fluticasone"),
(16, "Arthritis", "Arthritis refers to inflammation of one or more joints, causing pain and stiffness. It can affect people of all ages and backgrounds. Common symptoms include joint pain, swelling, and stiffness. Medications like Ibuprofen and Methotrexate are often prescribed for management.", "Joint Pain, Swelling, Stiffness", "Ibuprofen, Methotrexate"),
(17, "Osteoporosis", "Osteoporosis is a condition where bones become weak and brittle, making them more susceptible to fractures. It often progresses silently without symptoms until a fracture occurs. Symptoms may include bone pain, fractures, and loss of height. Treatment may involve calcium supplements and medications like Alendronate.", "Bone Pain, Fractures, Loss of Height", "Calcium Supplements, Alendronate"),
(18, "Anxiety Disorders", "Anxiety Disorders encompass a group of mental health conditions characterized by excessive worry or fear. It can manifest as physical symptoms like restlessness, fatigue, and muscle tension. Sertraline and Alprazolam are commonly prescribed medications for anxiety management.", "Worrying, Restlessness, Fatigue", "Sertraline, Alprazolam"),
(19, "Cancer", "Cancer is a group of diseases involving abnormal cell growth with the potential to invade or spread to other parts of the body. Symptoms vary depending on the type and stage of cancer but may include unexplained weight loss, fatigue, and pain. Treatment options range from chemotherapy to radiation therapy.", "Unexplained Weight Loss, Fatigue, Pain", "Chemotherapy, Radiation Therapy"),
(20, "Heart Attack", "A heart attack, or myocardial infarction, is a sudden and severe medical emergency caused by the blockage of blood flow to the heart. Common symptoms include chest pain, shortness of breath, and nausea. Immediate medical attention is crucial. Aspirin and Nitroglycerin are often administered.", "Chest Pain, Shortness of Breath, Nausea", "Aspirin, Nitroglycerin"),
(21, "Chronic Kidney Disease", "Chronic Kidney Disease is a progressive loss of kidney function over time. Early stages may have no symptoms, but as the disease progresses, symptoms such as fatigue, swelling, and changes in urination may occur. Medications like ACE inhibitors and dietary changes are part of the management.", "Fatigue, Swelling, Changes in Urination", "Enalapril, Losartan"),
(22, "Alzheimer\'s Disease", "Alzheimer\'s Disease is a neurodegenerative disorder that causes memory loss, cognitive decline, and changes in behavior. It is the most common cause of dementia. Symptoms may include confusion, mood swings, and difficulty speaking. Medications like Donepezil are used to manage cognitive symptoms.", "Memory Loss, Cognitive Decline, Changes in Behavior", "Donepezil, Memantine"),
(23, "Rheumatoid Arthritis", "Rheumatoid Arthritis is an autoimmune disorder that affects the joints, causing pain, swelling, and stiffness. It can also affect other organs. Symptoms include joint pain, morning stiffness, and fatigue. Disease-modifying antirheumatic drugs (DMARDs) are commonly prescribed.", "Joint Pain, Morning Stiffness, Fatigue", "Methotrexate, Hydroxychloroquine"),
(24, "Chronic Obstructive Pulmonary Disease (COPD)", "COPD is a chronic inflammatory lung disease that obstructs airflow, making breathing difficult. Symptoms include shortness of breath, chronic cough, and wheezing. Bronchodilators and inhaled corticosteroids are commonly used for management.", "Shortness of Breath, Chronic Cough, Wheezing", "Salbutamol, Tiotropium"),
(25, "Multiple Sclerosis", "Multiple Sclerosis is a chronic autoimmune disease that affects the central nervous system. Symptoms vary widely and may include fatigue, numbness, and difficulties with coordination. Disease-modifying therapies like Interferon-beta are used for treatment.", "Fatigue, Numbness, Coordination Difficulties", "Interferon-beta, Fingolimod"),
(26, "Parkinson\'s Disease", "Parkinson\'s Disease is a neurodegenerative disorder that affects movement. Symptoms include tremors, bradykinesia, and stiffness. Levodopa is a common medication used to manage motor symptoms in Parkinson\'s Disease.", "Tremors, Bradykinesia, Stiffness", "Levodopa, Pramipexole"),
(27, "Ovarian Cancer", "Ovarian Cancer is a type of cancer that begins in the ovaries. Symptoms may be subtle, but they can include abdominal bloating, pelvic pain, and changes in bowel habits. Treatment often involves surgery and chemotherapy.", "Abdominal Bloating, Pelvic Pain, Changes in Bowel Habits", "Carboplatin, Paclitaxel");




--
-- Data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `uses`, `side_effects`) VALUES
(11, "Aspirin", "Pain relief, fever reduction, anti-inflammatory", "Stomach upset, bleeding risk"),
(12, "Ibuprofen", "Pain relief, fever reduction, anti-inflammatory", "Stomach upset, kidney problems"),
(13, "Metformin", "Type 2 diabetes treatment", "Stomach upset, diarrhea"),
(14, "Lisinopril", "Hypertension treatment", "Dizziness, cough"),
(15, "Albuterol", "Asthma and COPD treatment", "Nervousness, tremor"),
(16, "Omeprazole", "Gastroesophageal reflux disease (GERD) treatment", "Headache, nausea"),
(17, "Simvastatin", "Cholesterol-lowering medication", "Muscle pain, liver problems"),
(18, "Sertraline", "Antidepressant", "Nausea, insomnia"),
(19, "Morphine", "Severe pain management", "Constipation, respiratory depression"),
(20, "Levothyroxine", "Hypothyroidism treatment", "Hair loss, weight changes"),
(21, "Cetirizine", "Allergy relief", "Drowsiness, dry mouth"),
(22, "Amlodipine", "Hypertension treatment", "Swelling of ankles, dizziness"),
(23, "Atorvastatin", "Cholesterol-lowering medication", "Joint pain, headache"),
(24, "Metoprolol", "Hypertension and angina treatment", "Fatigue, slow heart rate"),
(25, "Warfarin", "Anticoagulant", "Bleeding risk, easy bruising"),
(26, "Ciprofloxacin", "Antibiotic", "Nausea, diarrhea"),
(27, "Escitalopram", "Antidepressant", "Insomnia, drowsiness"),
(28, "Hydrochlorothiazide", "Diuretic", "Dehydration, low potassium"),
(29, "Acetaminophen", "Pain relief, fever reduction", "Liver damage, allergic reactions"),
(30, "Losartan", "Hypertension treatment", "Dizziness, dry cough"),
(31, "Diazepam", "Anxiety and muscle spasms", "Drowsiness, confusion"),
(32, "Clopidogrel", "Antiplatelet agent", "Bleeding risk, headache"),
(33, "Fluticasone", "Allergy and asthma treatment", "Nasal irritation, sore throat"),
(34, "Gabapentin", "Neuropathic pain management", "Dizziness, drowsiness"),
(35, "Amitriptyline", "Depression and chronic pain", "Dry mouth, constipation"),
(36, "Ranitidine", "Gastric acid reduction", "Headache, constipation"),
(37, "Carvedilol", "Hypertension and heart failure treatment", "Fatigue, low blood pressure"),
(38, "Furosemide", "Diuretic", "Dehydration, low potassium"),
(39, "Oxycodone", "Pain relief", "Nausea, constipation");

-- --------------------------------------------------------



--
-- Data for table `flashcards`
--

INSERT INTO `flashcards` (`id`, `category`, `question`, `answer`) VALUES
(1, "Endometriosis", "What is endometriosis?", "A disorder in which tissue similar to the tissue that forms the lining of the uterus grows outside the uterus."),
(2, "Renal Diseases", "What are common renal diseases?", "Chronic kidney disease, kidney stones, glomerulonephritis."),
(3, "Diabetes Mellitus", "What are the types of diabetes mellitus?", "Type 1, Type 2, gestational diabetes."),
(4, "Migraine", "What are common migraine triggers?", "Stress, lack of sleep, certain foods."),
(5, "Asthma", "What is an asthma attack?", "A sudden worsening of asthma symptoms, causing difficulty breathing."),
(6, "Arthritis", "What are the common types of arthritis?", "Osteoarthritis, rheumatoid arthritis, psoriatic arthritis."),
(7, "Osteoporosis", "What is osteoporosis?", "A condition characterized by low bone density and increased risk of fractures."),
(8, "Anxiety Disorders", "What are examples of anxiety disorders?", "Generalized anxiety disorder, panic disorder, social anxiety disorder."),
(9, "Cancer", "What are common types of cancer?", "Breast cancer, lung cancer, colorectal cancer."),
(10, "Heart Attack", "What are the symptoms of a heart attack?", "Chest pain, shortness of breath, nausea."),
(11, "Endometriosis", "What is endometriosis?", "A disorder in which tissue similar to the tissue that forms the lining of the uterus grows outside the uterus."),
(12, "Renal Diseases", "What are common renal diseases?", "Chronic kidney disease, kidney stones, glomerulonephritis."),
(13, "Diabetes Mellitus", "What are the types of diabetes mellitus?", "Type 1, Type 2, gestational diabetes."),
(14, "Migraine", "What are common migraine triggers?", "Stress, lack of sleep, certain foods."),
(15, "Asthma", "What is an asthma attack?", "A sudden worsening of asthma symptoms, causing difficulty breathing."),
(16, "Arthritis", "What are the common types of arthritis?", "Osteoarthritis, rheumatoid arthritis, psoriatic arthritis."),
(17, "Osteoporosis", "What is osteoporosis?", "A condition characterized by low bone density and increased risk of fractures."),
(18, "Anxiety Disorders", "What are examples of anxiety disorders?", "Generalized anxiety disorder, panic disorder, social anxiety disorder."),
(19, "Cancer", "What are common types of cancer?", "Breast cancer, lung cancer, colorectal cancer."),
(20, "Heart Attack", "What are the symptoms of a heart attack?", "Chest pain, shortness of breath, nausea."),
(21, "Chronic Kidney Disease", "What are the stages of chronic kidney disease?", "Stage 1, Stage 2, Stage 3, Stage 4, Stage 5."),
(22, "Alzheimer\'s Disease", "What are common early signs of Alzheimer\'s disease?", "Memory loss, difficulty planning, mood swings."),
(23, "Rheumatoid Arthritis", "What are the potential complications of rheumatoid arthritis?", "Joint deformities, inflammation of other organs, cardiovascular problems."),
(24, "Chronic Obstructive Pulmonary Disease (COPD)", "What are the risk factors for COPD?", "Smoking, exposure to pollutants, genetic factors."),
(25, "Multiple Sclerosis", "What are the common symptoms of multiple sclerosis?", "Fatigue, numbness, difficulty walking."),
(26, "Parkinson\'s Disease", "What are the non-motor symptoms of Parkinson\'s disease?", "Depression, sleep disturbances, cognitive changes."),
(27, "Ovarian Cancer", "What are the risk factors for ovarian cancer?", "Age, family history, genetic mutations."),
(28, "Gastroesophageal Reflux Disease (GERD)", "What lifestyle changes can help manage GERD?", "Elevating the head during sleep, avoiding trigger foods, weight management."),
(29, "Hypertension", "What lifestyle changes can help manage hypertension?", "Dietary changes, regular exercise, stress management."),
(30, "Diabetes Mellitus", "What are the complications of uncontrolled diabetes?", "Nerve damage, kidney damage, cardiovascular problems."),
(31, "Migraine", "How is a migraine diagnosis made?", "Based on symptoms, medical history, and ruling out other causes."),
(32, "Asthma", "What are common asthma triggers?", "Allergens, exercise, respiratory infections."),
(33, "Arthritis", "How is arthritis diagnosed?", "Physical examination, imaging tests, blood tests."),
(34, "Osteoporosis", "What are the risk factors for osteoporosis?", "Age, gender, family history, lack of physical activity."),
(35, "Anxiety Disorders", "What are common treatments for anxiety disorders?", "Therapy, medications, lifestyle changes."),
(36, "Cancer", "How is cancer diagnosed?", "Biopsy, imaging tests, blood tests."),
(37, "Heart Attack", "What are the emergency steps for a heart attack?", "Call emergency services, take aspirin if advised, wait for medical assistance."),
(38, "Chronic Kidney Disease", "How is chronic kidney disease diagnosed?", "Blood tests, urine tests, imaging tests."),
(39, "Alzheimer\'s Disease", "Is there a cure for Alzheimer\'s disease?", "No, but medications and lifestyle changes can help manage symptoms."),
(40, "Rheumatoid Arthritis", "What are the treatment options for rheumatoid arthritis?", "Medications, physical therapy, lifestyle changes."),
(41, "COPD", "How is COPD different from asthma?", "COPD is usually progressive and not fully reversible, while asthma can often be managed with treatment."),
(42, "Multiple Sclerosis", "How is multiple sclerosis treated?", "Disease-modifying therapies, symptom management, physical therapy."),
(43, "Parkinson\'s Disease", "What medications are used to treat Parkinson\'s disease?", "Levodopa, pramipexole, rasagiline."),
(44, "Ovarian Cancer", "What are the surgical options for ovarian cancer?", "Hysterectomy, oophorectomy, debulking surgery."),
(45, "GERD", "Can GERD lead to complications?", "Yes, it can lead to esophagitis, Barrett\'s esophagus, and increased risk of esophageal cancer."),
(46, "Hypertension", "What are the potential complications of hypertension?", "Heart attack, stroke, kidney damage."),
(47, "Diabetes Mellitus", "How is diabetes managed?", "Insulin therapy, oral medications, lifestyle changes."),
(48, "Migraine", "Can lifestyle changes help prevent migraines?", "Yes, managing stress, getting regular sleep, and avoiding trigger foods may help."),
(49, "Asthma", "Is asthma a lifelong condition?", "It varies, but for many people, asthma is a chronic condition that can be managed with treatment."),
(50, "Arthritis", "Can arthritis be prevented?", "Maintaining a healthy weight, staying physically active, and protecting joints can help reduce the risk."),
(51, "Osteoporosis", "What are the lifestyle recommendations for osteoporosis?", "Adequate calcium intake, weight-bearing exercises, and avoiding smoking and excessive alcohol."),
(52, "Anxiety Disorders", "Are there self-help strategies for managing anxiety?", "Yes, practices like deep breathing, mindfulness, and regular exercise can be beneficial."),
(53, "Cancer", "Can lifestyle choices impact cancer risk?", "Yes, avoiding tobacco, maintaining a healthy diet, and protecting against UV radiation can reduce the risk."),
(54, "Heart Attack", "What is the role of cholesterol in heart health?", "High levels of LDL cholesterol can contribute to heart disease, while HDL cholesterol is considered protective."),
(55, "Chronic Kidney Disease", "What are the dietary restrictions for chronic kidney disease?", "Limiting sodium, potassium, and phosphorus intake is often recommended.");

-- --------------------------------------------------------



--
-- Data for table `symptoms`
--

INSERT INTO `symptoms` (`id`, `name`, `description`, `diseases`) VALUES
(11, "Fever", "An elevated body temperature. It may indicate an infection or inflammatory condition.", "Influenza, Hypertension, Diabetes Mellitus"),
(12, "Headache", "Pain in the head or upper neck region. It can be caused by various conditions, including tension, migraines, or underlying health issues.", "Migraine, Hypertension, Anxiety Disorders"),
(13, "Fatigue", "Extreme tiredness or lack of energy. Persistent fatigue may be a symptom of various medical conditions.", "Hypertension, Diabetes Mellitus, Cancer"),
(14, "Shortness of Breath", "Difficulty breathing or a feeling of not getting enough air. It can be a symptom of respiratory or cardiovascular problems.", "Asthma, Heart Attack, Anxiety Disorders"),
(15, "Joint Pain", "Discomfort, aches, or soreness in the joints. Joint pain may be associated with arthritis or other inflammatory conditions.", "Arthritis, Osteoporosis, Rheumatoid Arthritis"),
(16, "Chest Pain", "A sensation of discomfort or distress in the chest. Chest pain can be a symptom of heart-related issues or other conditions.", "Heart Attack, Anxiety Disorders, Gastroesophageal Reflux Disease (GERD)"),
(17, "Nausea", "A feeling of sickness or queasiness. Nausea can be caused by various factors, including infections, medications, or pregnancy.", "Influenza, Cancer, Pregnancy"),
(18, "Blurred Vision", "Lack of sharpness of vision with objects appearing hazy or out of focus. Blurred vision may indicate eye problems or other underlying issues.", "Diabetes Mellitus, Migraine, Hypertension"),
(19, "Bone Pain", "Discomfort or aching in the bones. Bone pain may be associated with conditions affecting the skeletal system.", "Osteoporosis, Cancer, Arthritis"),
(20, "Palpitations", "An abnormal awareness of the heartbeat. Palpitations may be related to heart rhythm disturbances or other cardiovascular issues.", "Heart Attack, Anxiety Disorders, Arrhythmias"),
(21, "Abdominal Pain", "Pain or discomfort in the abdominal region. Abdominal pain may indicate gastrointestinal issues or organ-related problems.", "Appendicitis, Gastroenteritis, Kidney Stones"),
(22, "Short-Term Memory Loss", "Difficulty remembering recent events or information. Short-term memory loss may be associated with neurological or cognitive disorders.", "Alzheimer\'s Disease, Dementia, Mild Cognitive Impairment"),
(23, "Yellowing of the Skin (Jaundice)", "Yellow discoloration of the skin and eyes. Jaundice may be a symptom of liver or gallbladder problems.", "Hepatitis, Cirrhosis, Gallstones"),
(24, "Excessive Thirst", "Feeling extremely thirsty. Excessive thirst can be a symptom of dehydration, diabetes, or hormonal imbalances.", "Diabetes Mellitus, Dehydration, Diabetes Insipidus"),
(25, "Hair Loss", "Loss of hair from the scalp or other body parts. Hair loss can be caused by various factors, including hormonal changes or medical conditions.", "Alopecia, Thyroid Disorders, Chemotherapy-induced Alopecia"),
(26, "Difficulty Swallowing", "Trouble passing food or liquids from the mouth to the stomach. Difficulty swallowing may indicate esophageal or throat problems.", "Gastroesophageal Reflux Disease (GERD), Esophagitis, Throat Cancer"),
(27, "Persistent Cough", "A cough that lasts for an extended period. Persistent coughing may be a symptom of respiratory infections or chronic conditions.", "Bronchitis, Asthma, Lung Cancer"),
(28, "Unexplained Weight Loss", "Significant weight loss without a clear cause. Unexplained weight loss may be associated with various underlying health issues.", "Cancer, Hyperthyroidism, Malnutrition"),
(29, "Blood in Stool", "Presence of blood in the stool. Blood in the stool can be a symptom of gastrointestinal bleeding or other digestive issues.", "Colorectal Cancer, Hemorrhoids, Inflammatory Bowel Disease (IBD)"),
(30, "Muscle Weakness", "Reduced strength in muscles. Muscle weakness can be a symptom of neurological or muscular disorders.", "Myasthenia Gravis, Muscular Dystrophy, Amyotrophic Lateral Sclerosis (ALS)"),
(31, "Sensitivity to Light", "Increased sensitivity to light. Sensitivity to light may be associated with eye problems or migraines.", "Migraine, Conjunctivitis, Corneal Abrasion"),
(32, "Cold Intolerance", "Feeling excessively cold in normal conditions. Cold intolerance may be related to thyroid disorders or circulatory issues.", "Hypothyroidism, Raynaud\'s Disease, Anemia"),
(33, "Excessive Sweating", "Abnormally high levels of sweating. Excessive sweating may be a symptom of hyperhidrosis or underlying health conditions.", "Hyperthyroidism, Diabetes Mellitus, Menopause"),
(34, "Difficulty Concentrating", "Trouble focusing attention on tasks. Difficulty concentrating may be associated with attention disorders or mental health conditions.", "Attention Deficit Hyperactivity Disorder (ADHD), Anxiety Disorders, Depression"),
(35, "Tingling or Numbness", "Abnormal sensations like tingling or numbness. These sensations may be related to nerve damage or circulation problems.", "Peripheral Neuropathy, Carpal Tunnel Syndrome, Multiple Sclerosis"),
(36, "Frequent Urination", "Increased need to urinate frequently. Frequent urination may be a symptom of urinary tract infections or prostate issues.", "Urinary Tract Infection (UTI), Overactive Bladder, Prostatitis"),
(37, "Skin Rash", "Abnormal changes in the skin\'s appearance. Skin rashes can be caused by various factors, including allergies or infections.", "Eczema, Psoriasis, Allergic Reactions");

-- --------------------------------------------------------

--
-- Data for table `well_being_tips`
--

INSERT INTO `well_being_tips` (`id`, `topic`, `tip`) VALUES
(1, "Nutrition", "Eat a balanced diet with a variety of fruits, vegetables, whole grains, and lean proteins."),
(2, "Fitness", "Engage in regular physical activity, including cardio and strength training exercises."),
(3, "Mental Well-Being", "Practice mindfulness and stress-reduction techniques, such as meditation and deep breathing."),
(4, "Sleep Hygiene", "Maintain a consistent sleep schedule and create a relaxing bedtime routine."),
(5, "Hydration", "Drink an adequate amount of water"),
(6, "Nutrition", "Eat a balanced diet with a variety of fruits, vegetables, whole grains, and lean proteins."),
(7, "Fitness", "Engage in regular physical activity, including cardio and strength training exercises."),
(8, "Mental Well-Being", "Practice mindfulness and stress-reduction techniques, such as meditation and deep breathing."),
(9, "Sleep Hygiene", "Maintain a consistent sleep schedule and create a relaxing bedtime routine."),
(10, "Hydration", "Drink an adequate amount of water throughout the day to stay hydrated and support overall health."),
(11, "Stress Management", "Manage stress through activities like yoga, journaling, or spending time in nature."),
(12, "Social Connection", "Cultivate meaningful relationships and social connections for emotional well-being."),
(13, "Screen Time Balance", "Limit screen time, especially before bedtime, to promote better sleep and reduce eye strain."),
(14, "Sun Safety", "Protect your skin from the sun by using sunscreen, wearing protective clothing, and seeking shade."),
(15, "Regular Health Checkups", "Schedule regular health checkups and screenings to detect and address potential health issues early."),
(16, "Mindful Eating", "Practice mindful eating by savoring each bite, eating slowly, and paying attention to hunger and fullness cues."),
(17, "Posture Awareness", "Maintain good posture to prevent back and neck pain. Take breaks to stretch and move throughout the day."),
(18, "Positive Affirmations", "Incorporate positive affirmations into your daily routine to promote self-confidence and a positive mindset."),
(19, "Cognitive Exercises", "Engage in cognitive exercises, such as puzzles and memory games, to support brain health and cognitive function."),
(20, "Adequate Rest", "Ensure you get enough restful sleep each night to support overall well-being and cognitive function."),
(21, "Limit Caffeine Intake", "Be mindful of your caffeine intake and consider limiting it, especially in the afternoon and evening."),
(22, "Breathwork", "Practice deep breathing exercises to reduce stress, promote relaxation, and enhance focus."),
(23, "Express Gratitude", "Regularly express gratitude for the positive aspects of your life to foster a positive outlook."),
(24, "Mindful Movement", "Incorporate mindful movement practices like yoga or tai chi into your routine for physical and mental well-being."),
(25, "Nature Exposure", "Spend time in nature to reduce stress, improve mood, and promote a sense of well-being."),
(26, "Healthy Cooking", "Experiment with healthy cooking methods and recipes to enjoy nutritious and delicious meals."),
(27, "Digital Detox", "Take breaks from electronic devices for a digital detox to reduce screen time and enhance mental clarity."),
(28, "Creative Expression", "Engage in creative activities such as art, writing, or music to express yourself and promote emotional well-being."),
(29, "Goal Setting", "Set realistic and achievable goals for personal and professional growth to stay motivated and focused."),
(30, "Volunteerism", "Explore opportunities for volunteer work to contribute to your community and experience a sense of purpose."),
(31, "Mindful Commuting", "Practice mindfulness during your daily commute by focusing on your surroundings and embracing a calm mindset."),
(32, "Laugh Regularly", "Incorporate laughter into your routine through activities like watching comedies or spending time with humorous friends."),
(33, "Emotional Intelligence", "Develop emotional intelligence by recognizing and understanding your own emotions and those of others."),
(34, "Mindful Technology Use", "Use technology mindfully, setting boundaries to prevent excessive use and promote a healthy balance."),
(35, "Gratitude Journaling", "Maintain a gratitude journal to regularly reflect on and appreciate the positive aspects of your life."),
(36, "Plant-Based Nutrition", "Explore plant-based nutrition by incorporating a variety of fruits, vegetables, and plant-based proteins into your diet."),
(37, "Active Listening", "Practice active listening in your interactions with others to foster strong and meaningful connections."),
(38, "Positive Self-Talk", "Replace negative self-talk with positive affirmations to build self-esteem and resilience."),
(39, "Self-Care Rituals", "Establish self-care rituals, such as a relaxing bath or mindful meditation, to prioritize your well-being."),
(40, "Mindful Breathing", "Integrate mindful breathing exercises into your daily routine to promote relaxation and reduce stress."),
(41, "Mindful Reading", "Read mindfully, savoring the content and taking breaks to reflect on the material."),
(42, "Digital Mindfulness Apps", "Explore digital mindfulness apps that offer guided meditation and relaxation exercises for stress relief."),
(43, "Learning New Skills", "Challenge yourself by learning new skills or engaging in activities that stimulate your mind and creativity.");

--
-- END OF DATA
--

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flashcards`
--
ALTER TABLE `flashcards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `well_being_tips`
--
ALTER TABLE `well_being_tips`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `flashcards`
--
ALTER TABLE `flashcards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `well_being_tips`
--
ALTER TABLE `well_being_tips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;
