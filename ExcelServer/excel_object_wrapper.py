import xlwings as xw


class Model():
    def __init__(self, filepath):
        self.filepath = filepath
        self.app = 0
        self.wb = 0
        self.buttons = {}

    def get_model_interface(self):
        pass

    def run(self):
        self.app = xw.App(visible=False)
        self.wb = self.app.books.open(self.filepath)

        return self.wb

    def close(self):
        self.wb.close()
        self.app.quit()

    def find_button(self, value):
        wbs = self.wb.sheets['Sheet1']
        wbs.range('A1').value = value
        vba = self.wb.app.macro('get_Buttons')
        vba()

        fill = 1
        CurRange = self.wb.sheets['Sheet1'].range('A2:B2')
        while fill:
            text = CurRange.value
            if text[0] is None:
                fill = 0
            else:
                key_, val_ = text
                if val_ is None:
                    val_ = ''
                buttons = val_.split(',')[:-1]
                self.buttons[key_] = buttons
                CurRange = CurRange.offset(1)

        return self.buttons
