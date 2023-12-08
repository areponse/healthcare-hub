def format_text(text, width=88):
    lines = [text[i:i+width] for i in range(0, len(text), width)]
    return lines

class Base:
    def line(self, width=90):
        print("+", "-" * (width - 2), "+")

    def up(self, text):
        return text.upper()

    def newline(self, n=1):
        for i in range(n):
            print()
    
    def printline(self, text):
        print(f"|{text:^90}|")
    
    def printleftline(self, text):
        print(f"| {text.ljust(88)} |")
    
    def format_and_print(self, text, width=90):
        lines = format_text(text)
        self.printline(" ")
        for line in lines:
            print(f"| {line.ljust(88)} |")
        self.printline(" ")



class HealthTip(Base):
    def __init__(self, row):
        super().__init__()
        self.topic = row[1]
        self.tip = row[2]

    def print(self):
        self.line()
        self.printline(self.up(self.topic))
        self.line()
        self.format_and_print(self.tip)
        self.line()
        self.newline(2)


class Symptom(Base):
    def __init__(self, row):
        super().__init__()
        self.name = row[1]
        self.description = row[2]
        self.diseases = row[3].split(', ')

    def print(self):
        self.line()
        self.printline(self.up(self.name))
        self.line()
        self.format_and_print(self.description)
        self.printline(" ")
        self.printleftline("DISEASES")
        for index, disease in enumerate(self.diseases, start=1):
            self.printleftline(f"{index}. {disease}")
        self.line()
        self.newline(2)


class Disease(Base):
    def __init__(self, row):
        super().__init__()
        self.name = row[1]
        self.description = row[2]
        self.symptoms = row[3].split(', ')

    def print(self):
        self.line()
        self.printline(self.up(self.name))
        self.line()
        self.format_and_print(self.description)
        self.printline(" ")
        self.printleftline("SYMPTOMS")
        for index, symptom in enumerate(self.symptoms, start=1):
            self.printleftline(f"{index}. {symptom}")
        self.line()
        self.newline(2)


class Drug(Base):
    def __init__(self, row):
        super().__init__()
        self.name = row[1]
        self.uses = row[2].split(', ')
        self.side_effects = row[3].split(', ')

    def print(self):
        self.line()
        self.printline(self.up(self.name))
        self.line()
        self.printline(" ")
        self.printleftline("USES")
        for index, use in enumerate(self.uses, start=1):
            self.printleftline(f"{index}. {use}")
        self.printline(" ")
        self.printleftline("SIDE EFFECTS")
        for index, side_effect in enumerate(self.side_effects, start=1):
            self.printleftline(f"{index}. {side_effect}")
        self.line()
        self.newline(2)


class FlashCard(Base):
    def __init__(self, row):
        super().__init__()
        self.category = row[1]
        self.question = row[2]
        self.answer = row[3]

    def print(self):
        self.line()
        self.printline(self.category)
        self.printline(self.up(self.question))
        self.line()
        self.format_and_print(self.answer)
        self.line()
        self.newline(2)

class Post(Base):
    def __init__(self, row):
        super().__init__()
        self.category = row[1]
        self.title = row[2]
        self.description = row[3]
        self.person = row[4]
        self.created_date = row[5]

    def print(self):
        self.line()
        self.printline(self.category)
        self.printline(self.up(self.title))
        self.line()
        self.format_and_print(self.description)
        self.printleftline(f"BY:   {self.person}")
        self.printleftline(f"BY:   {self.created_date}")
        self.line()
        self.newline(2)
