import pygame
import time

pygame.init()
pygame.font.init()
size = 400, 400
screen = pygame.display.set_mode(size)


class Board:
    def __init__(self, width, height, color=pygame.Color('black')):
        self.width = width
        self.height = height
        self.board = [[0] * width for _ in range(height)]
        self.left = 10
        self.top = 10
        self.cell_size = 30
        self.color = color
        self.color_gray = color = pygame.Color('gray')

    def set_view(self, left, top, cell_size):
        self.left = left
        self.top = top
        self.cell_size = cell_size

    def render(self):
        if not WIN:
            for i in range(self.height):
                for j in range(self.width):
                    if self.board[i][j] == 0:
                        pygame.draw.rect(screen, self.color,
                                         [self.left + j * self.cell_size, self.top + i * self.cell_size, self.cell_size,
                                          self.cell_size], 1)
                    elif self.board[i][j] == 1:
                        pygame.draw.rect(screen, self.color,
                                         [self.left + j * self.cell_size, self.top + i * self.cell_size, self.cell_size,
                                          self.cell_size])
                    elif self.board[i][j] == 2:
                        pygame.draw.rect(screen, self.color_gray,
                                         [self.left + j * self.cell_size, self.top + i * self.cell_size, self.cell_size,
                                          self.cell_size])
        else:
            time.sleep(0.5)
            for i in range(self.height):
                for j in range(self.width):
                    if like[i][j] == 0:
                        pygame.draw.rect(screen, self.color, [self.left + j * self.cell_size,
                                                              self.top + i * self.cell_size,
                                                              self.cell_size, self.cell_size], 1)
                    elif like[i][j] == 1:
                        pygame.draw.rect(screen, self.color, [self.left + j * self.cell_size,
                                                              self.top + i * self.cell_size,
                                                              self.cell_size, self.cell_size])
                    elif like[i][j] == 2:
                        pygame.draw.rect(screen, self.color_gray, [self.left + j * self.cell_size,
                                                                   self.top + i * self.cell_size,
                                                                   self.cell_size, self.cell_size])
            time.sleep(2)

    def render_1(self):
        for i in range(10):
            font = pygame.font.Font(None, 24)
            surface = font.render(str(" ".join(map(str, answer_1[i]))), True, (0, 0, 0))
            screen.blit(surface, (310, i * 30 + 10))
        for i in range(10):
            if i == 1 or i == 3 or i == 5 or i == 7 or i == 9:
                font = pygame.font.Font(None, 15)
                surface = font.render(str(" ".join(map(str, answer_2[i]))), True, (0, 0, 0))
                screen.blit(surface, (i * 30 + 10, 320))
            else:
                font = pygame.font.Font(None, 15)
                surface = font.render(str(" ".join(map(str, answer_2[i]))), True, (0, 0, 0))
                screen.blit(surface, (i * 30 + 10, 310))


    def get_cell(self, mouse_pos):
        if self.left < mouse_pos[0] < self.left + self.width * self.cell_size and \
 \
                                self.top < mouse_pos[1] < self.top + self.height * self.cell_size:
            return (mouse_pos[0] - self.left) // self.cell_size, (mouse_pos[1] - self.top) // self.cell_size
        return None

    def get_click_left(self, mouse_pos):
        if mouse_pos is None:
            return None
        cell = self.get_cell(mouse_pos)
        if cell is None:
            return None
        self.on_click_left(cell)

    def get_click_right(self, mouse_pos):
        if mouse_pos is None:
            return None
        cell = self.get_cell(mouse_pos)
        if cell is None:
            return None
        self.on_click_right(cell)

    def on_click_left(self, cell):
        self.board[cell[1]][cell[0]] = abs(self.board[cell[1]][cell[0]] - 1)
        if people_board[cell[1]][cell[0]] == 0:
            people_board[cell[1]][cell[0]] = 1
        else:
            people_board[cell[1]][cell[0]] = 0

    def on_click_right(self, cell):
        self.board[cell[1]][cell[0]] = 2


people_board = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                ]

level_1 = [[0, 0, 0, 1, 1, 1, 1, 0, 0, 0],
           [0, 0, 1, 0, 0, 1, 1, 1, 0, 0],
           [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
           [0, 1, 0, 1, 0, 0, 1, 0, 1, 0],
           [1, 0, 0, 0, 1, 1, 0, 0, 0, 1],
           [1, 0, 0, 0, 1, 1, 0, 0, 0, 1],
           [0, 1, 0, 0, 0, 0, 1, 0, 1, 0],
           [0, 1, 0, 0, 1, 1, 0, 0, 1, 0],
           [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
           [0, 1, 1, 1, 1, 1, 1, 1, 1, 0],
           ]
answer_1 = [[4], [1, 3], [10], [1, 1, 1, 1], [1, 2, 1], [1, 2, 1], [1, 1, 1], [1, 2, 1], [1, 1], [8]]
answer_2 = [[1, 2], [2, 2, 1], [2, 2], [1, 2, 1], [1, 1, 2, 1, 1], [3, 2, 1, 1], [4, 1, 1], [2, 2], [2, 2, 1], [1, 2]]
like = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
        [0, 0, 0, 1, 1, 1, 0, 0, 0, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
        [1, 0, 1, 0, 0, 0, 0, 0, 1, 0],
        [1, 0, 1, 0, 0, 0, 0, 1, 0, 0],
        [1, 0, 1, 0, 0, 0, 0, 0, 1, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
WIN = False
b = pygame.Color('white')
c = pygame.Color('gray')
level = level_1
done = False
if level == level_1:
    x = 10
    y = 10
for i in range(10):
    for j in range(10):
        pass
board = Board(x, y)
clock = pygame.time.Clock()
A = True
board.render_1()
while not done:
    screen.fill(b)
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True
        if event.type == pygame.MOUSEBUTTONDOWN:
            if pygame.mouse.get_pressed()[0]:
                board.get_click_left(pygame.mouse.get_pos())
            if pygame.mouse.get_pressed()[2]:
                board.get_click_right(pygame.mouse.get_pos())
    if people_board == level:
        WIN = True
    board.render()
    board.render_1()
    pygame.display.flip()
    WIN = False
