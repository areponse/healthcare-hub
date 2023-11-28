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

---DATA

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



--- END OF DATA


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
