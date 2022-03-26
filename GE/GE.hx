// make a 3d engine that a user can use
package;

// import what we need
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

using namespace std;

// create the class
class Engine {
	// create the variables
	private JFrame frame;
	private JPanel panel;
	private BufferedImage image;
	private Graphics2D g2d;
	private int width;
	private int height;
	private int x;
	private int y;
	private int xSpeed;
	private int ySpeed;

	// create the constructor
	public Engine(int width, int height) {
		// set the variables
		this.width = width;
		this.height = height;
		x = 0;
		y = 0;
		xSpeed = 0;
		ySpeed = 0;

		// create the frame
		frame = new JFrame("3D Engine");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(width, height);
		frame.setVisible(true);

		// create the panel
		panel = new JPanel();
		panel.setSize(width, height);
		panel.setVisible(true);
		
		// add the panel to the frame
		frame.add(panel);

		// create the image
		image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		g2d = image.createGraphics();
		g2d.setColor(java.awt.Color.BLACK);
		g2d.fillRect(0, 0, width, height);

		// add the key listener
		frame.addKeyListener(new KeyListener() {
			public void keyPressed(KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_UP) {
					ySpeed = -1;
				} else if (e.getKeyCode() == KeyEvent.VK_DOWN) {
					ySpeed = 1;
				} else if (e.getKeyCode() == KeyEvent.VK_LEFT) {
					xSpeed = -1;
				} else if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
					xSpeed = 1;
				}
			}

			public void keyReleased(KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_UP) {
					ySpeed = 0;
				} else if (e.getKeyCode() == KeyEvent.VK_DOWN) {
					ySpeed = 0;
				} else if (e.getKeyCode() == KeyEvent.VK_LEFT) {
					xSpeed = 0;
				} else if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
					xSpeed = 0;
				}
			}

			public void keyTyped(KeyEvent e) {
			}
		});

		// add the mouse listener
		frame.addMouseListener(new MouseListener() {
			public void mouseClicked(MouseEvent e) {
			}

			public void mouseEntered(MouseEvent e) {
			}

			public void mouseExited(MouseEvent e) {
			}

			public void mousePressed(MouseEvent e) {
			}

			public void mouseReleased(MouseEvent e) {
			}
		});

		// add the mouse motion listener
		frame.addMouseMotionListener(new MouseMotionListener() {
			public void mouseDragged(MouseEvent e) {
			}

			public void mouseMoved(MouseEvent e) {
			}

			public void mouseWheelMoved(MouseWheelEvent e) {
			}
		});

		// add the mouse wheel listener
		frame.addMouseWheelListener(new MouseWheelListener() {
			public void mouseWheelMoved(MouseWheelEvent e) {
			}
		});
	}

	// create the update method
	public void update() {
		// set the variables
		x += xSpeed;
		y += ySpeed;

		// set the background
		g2d.setColor(java.awt.Color.BLACK);
		g2d.fillRect(0, 0, width, height);

		// set the color
		g2d.setColor(java.awt.Color.WHITE);

		// draw the lines
		for (int i = 0; i < width; i++) {
			g2d.drawLine(i, 0, i, height);
		}
		for (int i = 0; i < height; i++) {
			g2d.drawLine(0, i, width, i);
		}

		// draw the circle
		g2d.drawOval(x, y, 100, 100);

		// draw the image
		panel.repaint();
	}
}

// create the class
class Main {
	// create the main method
	public static void main(String[] args) {
		// create the engine
		Engine engine = new Engine(800, 800);

		// run the engine
		while (true) {
			engine.update();
		}
	}
}
// end of the program
